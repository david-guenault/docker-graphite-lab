[cache]
USER=root
LINE_RECEIVER_INTERFACE=0.0.0.0
MAX_CACHE_SIZE = 83333333
MAX_CREATES_PER_MINUTE = 200
MAX_UPDATES_PER_SECOND = 2000
LINE_RECEIVER_INTERFACE = 0.0.0.0
PICKLE_RECEIVER_INTERFACE = 0.0.0.0
CACHE_QUERY_INTERFACE = 0.0.0.0
LINE_RECEIVER_PORT = 2003
PICKLE_RECEIVER_PORT = 2004
CACHE_QUERY_PORT = 7002
ENABLE_TAGS = False
LOG_DIR=/var/log/graphite

[cache:1]
LINE_RECEIVER_PORT = 2003
PICKLE_RECEIVER_PORT = 2004
CACHE_QUERY_PORT = 7002