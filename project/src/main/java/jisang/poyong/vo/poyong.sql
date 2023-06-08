select * from chatinfo
\
select * from userinfo

INSERT INTO chatinfo (senduser, chattext, chatdate, receiveuser)
        VALUES (#{senduser}, #{chattext}, NOW(), "smhrd2")
        
