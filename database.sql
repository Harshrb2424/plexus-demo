CREATE TABLE plexus_events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP,
    location VARCHAR(255),
    organization VARCHAR(100),
    event_image VARCHAR(255),
    event_background VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE plexus_organizations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    heads VARCHAR(100)[],
    members VARCHAR(100)[],
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO plexus_events (title, description, start_date, end_date, location, organization)
VALUES 
    ('HACKATHONS AND CODING COMPETITIONS', 'A technical event for coding enthusiasts.', '2024-01-15 10:00:00', '2024-01-15 18:00:00', 'Tech Center', 'Tech Club'),
    ('WORKSHOPS AND TECH TALKS', 'Learn about the latest technologies and industry trends.', '2024-02-01 14:00:00', '2024-02-01 17:00:00', 'Conference Room', 'Tech Club'),
    ('OPEN SOURCE CONTRIBUTIONS', 'Contribute to open source projects and enhance your coding skills.', '2024-02-15 09:30:00', '2024-02-15 16:30:00', 'Tech Hub', 'Tech Club'),
    ('BOOK CLUB', 'A non-technical event for book lovers.', '2024-03-05 18:30:00', '2024-03-05 20:30:00', 'Library', 'Literary Society'),
    ('FITNESS CHALLENGES', 'Participate in various fitness challenges and stay active.', '2024-03-20 08:00:00', '2024-03-20 10:00:00', 'Fitness Center', 'Sports Club');

UPDATE plexus_events
SET
    event_image = 'https://plshroffcollege.com/wp-content/uploads/2020/02/Events-plshroff.jpg',
    event_background = 'https://content.jdmagicbox.com/comp/ernakulam/m4/0484px484.x484.140206113128.a9m4/catalogue/we-create-events-panampilly-nagar-ernakulam-event-management-companies-nsobpzm660.jpg?clr='

INSERT INTO plexus_organizations (name, heads, members, description)
VALUES 
    ('Plexus', ARRAY['Benhin', 'Harshaaditya'], ARRAY['B Akhilesh', 'M Hyndhavi'], 'Department of Association'),
    ('Tech Club', ARRAY['K Dhanush', 'K Narmatha'], ARRAY['A Alekhya', 'S Snehitha', 'BL Bharani', 'P Vamshi', 'M Manoj', 'K Arjun'], 'A club for tech enthusiasts'),
    ('Non Tech Club', ARRAY['CH Aravind Yadav', 'D Madhuri'], ARRAY['A Alekhya', 'S Snehitha', 'BL Bharani', 'P Vamshi', 'M Manoj', 'K Arjun'], 'A club for non-tech activities'),
    ('Social Media Club', ARRAY['V Surya Kiran', 'M Urvi'], ARRAY['A Alekhya', 'S Snehitha', 'BL Bharani', 'P Vamshi', 'M Manoj', 'K Arjun'], 'A club for sports enthusiasts'),
    ('Sports Club', ARRAY['S Srikar', 'Ch. Pavani'], ARRAY['A Alekhya', 'S Snehitha', 'BL Bharani', 'P Vamshi', 'M Manoj', 'K Arjun'], 'A club for sports enthusiasts'),
    ('Esports Club', ARRAY['EsportsHead1', 'EsportsHead2'], ARRAY['A Alekhya', 'S Snehitha', 'BL Bharani', 'P Vamshi', 'M Manoj', 'K Arjun'], 'A club for esports enthusiasts');