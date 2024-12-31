# 今年给多少人发消息
SELECT
	COUNT( DISTINCT ( messages2024.Remark ) ) AS '总聊天人数' 
FROM
	messages2024;# 聊天信息数量排序
SELECT
	row_number ( ) over ( ORDER BY COUNT( messages2024.Remark ) DESC ) AS '名次',
	messages2024.Remark AS '好友昵称',
	COUNT( messages2024.Remark ) AS '聊天条数' 
FROM
	messages2024 
WHERE
	messages2024.remark != '' 
GROUP BY
	messages2024.remark 
ORDER BY
	COUNT( messages2024.Remark ) DESC;

# 我发的消息最多
SELECT
	row_number ( ) over ( ORDER BY COUNT( messages2024.Remark ) DESC ) AS '名次',
	messages2024.Remark AS '昵称',
	COUNT( messages2024.Remark ) AS '我发的条数' 
FROM
	messages2024 
WHERE
	messages2024.remark != '' 
	AND messages2024.IsSender = 1 
GROUP BY
	messages2024.remark 
ORDER BY
	COUNT( messages2024.Remark ) DESC;

SELECT
	row_number ( ) over ( ORDER BY COUNT( messages2024.Remark ) DESC ) AS '名次',
	messages2024.Remark AS '昵称',
	COUNT( messages2024.Remark ) AS '对方发的条数' 
FROM
	messages2024 
WHERE
	messages2024.remark != '' 
	AND messages2024.IsSender = 0 
GROUP BY
	messages2024.remark 
ORDER BY
	COUNT( messages2024.Remark ) DESC;
	
# 群里发消息数量排序
SELECT
	row_number ( ) over ( ORDER BY COUNT( messages2024.NickName ) DESC ) AS '名次',
	messages2024.NickName AS '群聊名称',
	COUNT( messages2024.NickName ) AS '我发的消息数' 
FROM
	messages2024 
WHERE
	messages2024.Remark IS NULL 
	AND messages2024.isSender = 1 
GROUP BY
	messages2024.NickName 
ORDER BY
	COUNT( messages2024.NickName ) DESC;
	
# 群里收消息数量排序
SELECT
	row_number ( ) over ( ORDER BY COUNT( messages2024.NickName ) DESC ) AS '名次',
	messages2024.NickName AS '群聊名称',
	COUNT( messages2024.NickName ) AS '我收到的消息数' 
FROM
	messages2024 
WHERE
	messages2024.Remark IS NULL 
	AND messages2024.isSender = 0 
GROUP BY
	messages2024.NickName 
ORDER BY
	COUNT( messages2024.NickName ) DESC;


SELECT
	count( * ) AS '今年消息总数' 
FROM
	messages2024;