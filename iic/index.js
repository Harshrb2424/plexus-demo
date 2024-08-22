$(document).ready(function () {
  var patterns = $(".pattern");
  var currentIndex = 0;

  function showNextPattern() {
    patterns.fadeOut(); // Hide all patterns
    patterns.eq(currentIndex).fadeIn(); // Show the current pattern
    currentIndex = (currentIndex + 1) % patterns.length; // Move to the next index, loop back if at the end
  }

  showNextPattern(); // Show the first pattern
  setInterval(showNextPattern, 15000); // Change the pattern every 1 minute

  var isBg1Visible = true;

  function toggleBackgrounds() {
    if (isBg1Visible) {
      $(".bg1").fadeOut();
      $(".bg2").fadeIn();
    } else {
      $(".bg1").fadeIn();
      $(".bg2").fadeOut();
    }
    isBg1Visible = !isBg1Visible; // Toggle the visibility state
  }

  toggleBackgrounds();
  setInterval(toggleBackgrounds, 30000); // Alternate every 1 minute

});
