const express = require ('express');
const bodyParser = require ('body-parser');
const path = require('path');
const passport = require ('passport');
const GoogleStrategy = require ('passport-google-oauth20').Strategy;
require('dotenv').config();

passport.use(new GoogleStrategy({
    clientID: process.env.GOOGLE_CLIENT_ID,
    clientSecret: process.env.GOOGLE_CLIENT_SECRET,
    callbackURL: 'http://localhost:3000/auth/google/callback'
  },
  (accessToken, refreshToken, profile, done) => {
    console.log(profile);
    // Store user information in the database or session
    return done(null, profile);
  }
));
passport.serializeUser((user, done) => {
    done(null, user);
  });
  
  // Deserialize user from the session
  passport.deserializeUser((obj, done) => {
    done(null, obj);
  });

const app = express();
app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));
app.use(express.static(path.join(__dirname, 'public')));
app.use(require('cookie-parser')());
app.use(require('express-session')({ secret: 'your-secret-key', resave: true, saveUninitialized: true }));

app.use(passport.initialize());
app.use(passport.session());

// Routes
app.get('/auth/google',
  passport.authenticate('google', { scope: ['profile', 'email'] })
);

app.get('/auth/google/callback',
  passport.authenticate('google', { failureRedirect: '/' }),
  (req, res) => {
    console.log("Successful authentication, redirect home.");
    // Successful authentication, redirect home.
    res.redirect('/');
  }
);

// Example protected route
app.get('/profile',
  isAuthenticated,
  (req, res) => {
    res.send(`Hello, ${req.user.displayName}!`);
  }
);

// Logout route
app.get('/logout', (req, res) => {
  req.logout();
  res.redirect('/');
});
app.get('/', (req, res) => {
  res.render("index.ejs");
});

app.get('/event', (req, res) => {
  if (req.isAuthenticated()) {
      res.render("event.ejs");
    } else {
      res.redirect('/auth/google');
}
});

function isAuthenticated(req, res, next) {
  if (req.isAuthenticated()) {
    return next();
  }
  res.redirect('/');
}

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});