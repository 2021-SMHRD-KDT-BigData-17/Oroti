select * from chatinfo
select * from userinfo

INSERT INTO chatinfo (senduser, chattext, chatdate, receiveuser)
        VALUES (#{senduser}, #{chattext}, NOW(), "smhrd2")
        
        SELECT companyname, noticejobcode, noticeregdate, noticeperiod 
		FROM noticeinfo
		ORDER BY noticeregdate DESC