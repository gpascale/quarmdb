FROM mysql:8

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=quarm
ENV MYSQL_DATABASE=quarm

# Copy your .sql files into the container's docker-entrypoint-initdb.d directory
# All .sql files here will be automatically executed on container startup
COPY ./*.sql /docker-entrypoint-initdb.d/