import pymysql

# Connect to the database
connection = pymysql.connect(host='baseballanalytics.coz99vsj8eej.us-east-2.rds.amazonaws.com',
                             user='admin',
                             password='RQ47b225',
                             db='baseball_analytics')

cursor = connection.cursor()

# Execute batting analytics view 
cursor.execute('SELECT * FROM batting_analytics')
batting_results = cursor.fetchall()

print("Batting Analytics:")
for row in batting_results:
    print(row)

# Execute pitching analytics view
cursor.execute('SELECT * FROM pitching_analytics')  
pitching_results = cursor.fetchall()

print("\nPitching Analytics:")
for row in pitching_results:
    print(row)

# Close connection
connection.close()