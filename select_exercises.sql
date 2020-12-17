# The name of all albums by Pink floyd
    SELECT * FROM albums WHERE artist = 'Pink Floyd';
        3	Pink Floyd	The Dark Side of the Moon	1973	24.2	Progressive rock
        29	Pink Floyd	The Wall	1979	17.6	Progressive rock

# The year Sgt. Pepper''s Lonely Hearts Club Band was released
    SELECT * FROM albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';
        15	The Beatles	Sgt. Pepper''s Lonely Hearts Club Band	1967	13.1	Rock

# The genre for the album Nevermind
    SELECT * FROM albums WHERE name = 'Nevermind';
        28	Nirvana	Nevermind	1991	16.7	Grunge, Alternative rock

# Which albums were released in the 1990s
    SELECT * FROM albums WHERE release_date BETWEEN 1990 AND 1999;
        5	Whitney Houston / Various artists	The Bodyguard	1992	28.4	R&B, Soul, Pop, Soundtrack
        12	Alanis Morissette	Jagged Little Pill	1995	24.4	Alternative rock
        13	Shania Twain	Come On Over	1997	29.6	Country, Pop
        14	Celine Dion	Falling into You	1996	20.2	Pop, Soft rock
        19	Celine Dion	Let''s Talk About Love	1997	19.3	Pop, Soft rock
        21	Michael Jackson	Dangerous	1991	16.3	Rock, Funk, Pop
        22	Madonna	The Immaculate Collection	1990	19.4	Pop, Dance
        26	James Horner	Titanic: Music from the Motion Picture	1997	18.1	Soundtrack
        27	Metallica	Metallica	1991	21.2	Thrash metal, Heavy metal
        28	Nirvana	Nevermind	1991	16.7	Grunge, Alternative rock
        30	Santana	Supernatural	1999	20.5	Rock

# Which albums had less than 20 million certified sales
    SELECT * FROM albums WHERE sales < 20;
        9	Various artists	Grease: The Original Soundtrack from the Motion Picture	1978	14.4	Soundtrack
        11	Michael Jackson	Bad	1987	19.3	Pop, Funk, Rock
        15	The Beatles	Sgt. Pepper''s Lonely Hearts Club Band	1967	13.1	Rock
        17	Various artists	Dirty Dancing	1987	17.9	Pop, Rock, R&B
        19	Celine Dion	Lets Talk About Love	1997	19.3	Pop, Soft rock
        21	Michael Jackson	Dangerous	1991	16.3	Rock, Funk, Pop
        22	Madonna	The Immaculate Collection	1990	19.4	Pop, Dance
        23	The Beatles	Abbey Road	1969	14.4	Rock
        24	Bruce Springsteen	Born in the U.S.A.	1984	19.6	Rock
        25	Dire Straits	Brothers in Arms	1985	17.7	Rock, Pop
        26	James Horner	Titanic: Music from the Motion Picture	1997	18.1	Soundtrack
        28	Nirvana	Nevermind	1991	16.7	Grunge, Alternative rock
        29	Pink Floyd	The Wall	1979	17.6	Progressive rock

# All the albums with a genre of "Rock". 
    SELECT * FROM albums WHERE genre = 'Rock';
        15	The Beatles	Sgt. Pepper''s Lonely Hearts Club Band	1967	13.1	Rock
        20	The Beatles	1	2000	22.6	Rock
        23	The Beatles	Abbey Road	1969	14.4	Rock
        24	Bruce Springsteen	Born in the U.S.A.	1984	19.6	Rock
        30	Santana	Supernatural	1999	20.5	Rock

            ## Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
                Because for a query result to show "Hard Rock" or "Progressive Rock" you would need to specify you 
                want to see those results. Even though "rock" is in the genre name does not mean it will show in the
                results. It is also only looking for genre that only identify with "Rock" alone.