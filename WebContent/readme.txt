sqoop export --connect jdbc:oracle:thin:@70.12.246.75:1521:xe --username SCOTT --password TIGER --table RECORD --staging-table RECORDSTAGING --clear-staging-table -m 4 --export-dir /user/project

sqoop export --connect jdbc:oracle:thin:@70.12.246.75:1521:xe --username SCOTT --password TIGER --table RENTAL --staging-table RENTALSTAGING --clear-staging-table -m 1 --export-dir /user/project/station --input-fields-terminated-by "," --input-lines-terminated-by '\n'

sqoop export --connect jdbc:oracle:thin:@70.12.246.75:1521:xe --username SCOTT --password TIGER --table RECORD --staging-table RECORDSTAGING --clear-staging-table -m 1 --export-dir /user/project/record1 --input-fields-terminated-by "," --input-lines-terminated-by '\n'

sqoop export --connect jdbc:oracle:thin:@70.12.246.75:1521:xe --username SCOTT --password TIGER --table RECORD --staging-table RECORDSTAGING --clear-staging-table -m 1 --export-dir /user/project/test3 --input-fields-terminated-by "," --input-lines-terminated-by '\n'

sqoop export --connect jdbc:oracle:thin:@192.168.200.196:1521:xe --username SCOTT --password TIGER --table RECORD --staging-table RECORDSTAGING --clear-staging-table -m 1 --export-dir /user/project/record1 --input-fields-terminated-by ',' --input-lines-terminated-by '\n'

sqoop export --connect jdbc:oracle:thin:@192.168.200.196:1521:xe --username SCOTT --password TIGER --table RECORD --staging-table RECORDSTAGING --clear-staging-table -m 1 --export-dir /user/project/test3 --input-fields-terminated-by "," --input-lines-terminated-by '\n'