CREATE DATABASE IF NOT EXISTS webshop;
USE webshop;

CREATE TABLE IF NOT EXISTS product (
  productID int PRIMARY KEY auto_increment,
  name varchar(50) NOT NULL,
  short_desc varchar(100) NOT NULL,
  long_desc varchar(255) NOT NULL,
  price float,
  img varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS adminLogin (
  userID int PRIMARY KEY auto_increment,
  username varchar(50) NOT NULL,
  pwd varchar(50) NOT NULL
);

INSERT INTO adminLogin (username, pwd) VALUES ("admin", "password");

INSERT INTO product (name, short_desc, long_desc, price, img) VALUES ("Football boots", "adidas Performance, color: black/action white, size: 42 - (EU)", "X GHOSTED 4.0 FOOTBALL BOOTS FIRM GROUND (2016)"  , 500.0, "football-boots.jpg");
INSERT INTO product (name, short_desc, long_desc, price, img) VALUES ("Bicycle", " weight 12 kg, color: black/blue, slim edition ", "Fast racing bike from Jamis. Includes 16 gears for optimal speed ",  4999.0, "bicycle.png");
INSERT INTO product (name, short_desc, long_desc, price, img) VALUES ("Snowboard", " Length: 170 cm - unisex editon.", "JONES TEAM 170 2021 SNOWBOARD", 3999.0, "snowboard.webp");
INSERT INTO product (name, short_desc, long_desc, price, img) VALUES ("Football", "Medium size - fotball", " Offical Adidas fotball - fifa World cup brazil editon  ", 200.0, "football.jpg");

INSERT INTO product (name, short_desc, long_desc, price, img) VALUES ("Basketball", "NBA OFFICIAL GAME BALL", "Official NBA size: 7 and weight: 29.5. Designed for indoor play only", 399.0, "basketball.png");
INSERT INTO product (name, short_desc, long_desc, price, img) VALUES ("Tennis racket", "Weight: 300g, Length: 685 mm, Balance: 315", "WILSON PRO STAFF RF 97 AUTOGRAPH V13.0 ", 500.0, "tennis-racket.jpg");
INSERT INTO product (name, short_desc, long_desc, price, img) VALUES ("Running shoes", "Size: 43 - (EU), weight: 228g, color: black/white/grey", "Nike Performance ZOOM FLY 3 - Neutral running shoes", 200.0, "running-shoes.jpg");
INSERT INTO product (name, short_desc, long_desc, price, img) VALUES ("Sneakers","size: 43 - (EU), color black/red ", "adidas Yeezy Boost 350 V2 Pirate Black (2018)", 3500, "sneakers.jpg");

INSERT INTO product (name, short_desc, long_desc, price, img) VALUES ("Luminous Basketball"," Reflective basektball - size: 7 and weight: 29.5  ", "CROSSWAY Star Night Holographic Glowing - Basketball Ball. Designed for both Indoor and Outdoor play", 699, "glowing-basketball.webp");
INSERT INTO product (name, short_desc, long_desc, price, img) VALUES ("Skateboard", "color: black, size: 8 ", "Enuff Classic Skateboard Deck", 587, "skateboard.jpg");
INSERT INTO product (name, short_desc, long_desc, price, img) VALUES ("Electric skateboard ", "Weigh only 8.8lbs, 27.75Inch Deck Length, ", "Electric Longboard with Remote Control. Certified 29.4v 2000mAh lithium battery", 2807, "el-skateboard.jpg");
Insert INTO product (name, short_desc, long_desc, price, img) VALUES ("Infinity gaunlet", "Thanos' exclusive infinity gauntlet", " Only available for purchase if we get an A on this assignment", 999, "inf-gauntlet.jpg");

Insert INTO product (name, short_desc, long_desc, price, img) VALUES ("Floorball club", " Stick Length: 100 cm", "Intermediate Sticks - 2020 Salming Aero Z Floorball Stick", 996, "floorball-club.jpg");
Insert INTO product (name, short_desc, long_desc, price, img) VALUES ("Golf clubs", "Color: Black, weight: 3.8kg, Flex: regular ", "Cobra Golf 2019 Men''s XL Speed Complete Golf Set", 3799, "golf-clubs.jpg");
Insert Into product (name, short_desc, long_desc, price, img) VALUES ("Badminton racket", " Tour Badminton Kit ", "Senston Badminton Rackets 4 Pack Badminton Set Including 2 Badminton Bags and 4 shuttlecocks.", 651, "badminton-racks.jpg");
Insert Into product (name, short_desc, long_desc, price, img) VALUES ("Ice skating shoes", "Color: White, size between 36-42 (EU)", "American Athletic Shoe Girl''s Tricot Lined Ice Skates", 569, "ice-skate-shoes.jpg");

Insert Into product (name, short_desc, long_desc, price, img) VALUES ("Champoin backpack", "Height: 44cm and length: 32cm, Color: Black", "Champoin LEGACY BACKPACK - (2019)", 299, "champ-backpack.jpeg");
Insert Into product (name, short_desc, long_desc, price, img) VAlUES ("Tracksuit", "color: black, size: M - (EU)", "ADIDAS COLOR CLASSICS PROMO BLACK TRACKSUIT", 350, "tracksuit.png");
Insert Into product (name, short_desc, long_desc, price, img) VAlUES ("Print T-shirt", "color: blue, size: S - (EU) ", "Adidas Primeblue T-shirt short sleve, included addidas logo print", 167, "tshirt.jpg");
Insert Into product (name, short_desc, long_desc, price, img) VAlUES ("Long sleeved top - white", "Color: white: size: S - (EU) ", "Hummel LEGACY SUPUERIOR STREACH MENS - Long sleeved top (WHITE)", 200, "sleeve-white.png");

Insert Into product (name, short_desc, long_desc, price, img) VAlUES ("Long sleeved top - black", "color: Black, size: M - (EU)", "Hummel LEGACY SUPUERIOR STREACH MENS - Long sleeved top (BLACK)", 195, "sleeve-black.png");
Insert Into product (name, short_desc, long_desc, price, img) VAlUES ("Training shorts", "Color: black, size: M - (EU)", "PUMA Liga Core training shorts  - Mens", 220, "training-shorts.webp");
Insert Into product (name, short_desc, long_desc, price, img) VAlUES ("Hoodie - black", "Color: black, size: M - (EU)", "Adidas Performance Core Eleven Football Hoddie Sweat", 379, "hoodie.jpg");
Insert Into product (name, short_desc, long_desc, price, img) VAlUES ("Sports shorts", "color: black, size: M - (EU)", "Nike Performance Academy Unisex - Flex short", 255, "sport-shorts.jpg");

Insert Into product (name, short_desc, long_desc, price, img) VAlUES ("Yoga mat", "size: 6 mm, color: Purple", " Allround everyday unisex yoga mat - Lilac Purple", 630, "yoga-mat.jpg" );
Insert Into product (name, short_desc, long_desc, price, img) VAlUES ("Goalkeeping gloves", "color: red/white/black, size: 4.5 - (EU)", "Adidas Mercurial  Goalkeeper Touch Elite", 640, "gloves.webp");
Insert Into product (name, short_desc, long_desc, price, img) VAlUES ("Headband unisex" , "Color: black, Size: One size - (EU)"," Under armor  Dri-Fit Fury Headband 3.0", 140, "headband.jpg");
Insert Into product (name, short_desc, long_desc, price, img) VAlUES ("Drink bottle" , "Sports drink bottle- 2,2L", "Ardee Big Performance Hypercharge Bottle - Unisex ", 60, "bottle.jpeg");

Insert Into product (name, short_desc, long_desc, price, img) VAlUES ("Tracksuit bottoms", "Color: black, size: M - (EU)", "Champion Fleece Cuff Pants", 263, "tracksuit-bottom.jpg");
Insert Into product (name, short_desc, long_desc, price, img) VAlUES ("Sports socks pack", "size: 39 - 42 (EU), color: black/white/grey ", "FILA Crew 3 pair plain socks  - unisex", 130, "socks.jpg");
