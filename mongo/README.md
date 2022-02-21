use admin
db.auth("root","123456")
use dbname
db.createUser({ user: "wms-operate",pwd: "123456",  roles: [ { role: "readWrite", db: "dbname" } ] })