
\c turku_kartalle

-- DROP TABLE IF EXISTS turku_paikat; 
CREATE TABLE turku_paikat (
       nimi varchar,
       kuva_url varchar,
       kuva_info_url varchar,
       kuva_license_text varchar,
       license_info_url varchar,
       geom geometry(point),
       id uuid NOT NULL DEFAULT uuid_generate_v1mc(),
       CONSTRAINT turku_pkey PRIMARY KEY (id)
)
WITH (
     OIDS=FALSE
);

INSERT INTO turku_paikat (nimi, kuva_url, kuva_info_url, kuva_license_text, license_info_url, geom)
       VALUES (
       'Turun linna',
       'https://farm1.staticflickr.com/751/22190423216_a6e2da2f01_q_d.jpg',
       'https://flic.kr/p/zNTHHJ',
       'Kuvaaja: Andy Miccone (public domain)',
       NULL,
       ST_PointFromText('POINT(22.228924 60.435411)', 4326)
);

INSERT INTO turku_paikat (nimi, kuva_url, kuva_info_url, kuva_license_text, license_info_url, geom)
       VALUES (
       'Turun tuomiokirkko',
       'https://farm4.staticflickr.com/3357/3276733951_6a7833d31a_m_d.jpg',
       'https://flic.kr/p/5Zy7QX',
       'Kuvaaja: Hans Põldoja (CC-BY-2.0)',
       'https://creativecommons.org/licenses/by/2.0/',
       ST_PointFromText('POINT(22.27846 60.45243)', 4326)
);

INSERT INTO turku_paikat (nimi, kuva_url, kuva_info_url, kuva_license_text, license_info_url, geom)
       VALUES (
       'Aurajoki',
       'https://farm7.staticflickr.com/6210/6119394515_797efe8092_m_d.jpg',
       'https://flic.kr/p/ajKuMZ',
       'Kuvaaja: Grzegorz Jereczek (CC-BY-2.0)',
       'https://creativecommons.org/licenses/by/2.0/',
       ST_PointFromText('POINT(22.25986 60.44580)', 4326)
);

INSERT INTO turku_paikat (nimi, kuva_url, kuva_info_url, kuva_license_text, license_info_url, geom)
       VALUES (
       'Sami Köykkä - Sosiaalisen median kehitysnäkymiä 2009, Kupittaa',
       'https://farm4.staticflickr.com/3328/3479703376_5da0e75109_m_d.jpg',
       'https://flic.kr/p/6iuozN',
       'Kuvaaja: Jari Sjölund (CC-BY-2.0)',
       'https://creativecommons.org/licenses/by/2.0/',
       ST_PointFromText('POINT(22.2914 60.4484)', 4326)
);


