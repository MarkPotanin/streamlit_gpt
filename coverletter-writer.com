server {
    listen 80;
    server_name coverletter-writer.com;

    location / {
        proxy_pass http://localhost:8501;
	    proxy_http_version 1.1;
        proxy_set_header Host $host;
	    proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        #proxy_set_header X-Real-IP $remote_addr;
        #proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        #proxy_set_header X-Forwarded-Proto $scheme;
    }
}
