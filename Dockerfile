FROM python:3.11.0b1-buster

# set work directory
WORKDIR /app


# dependencies for psycopg2
# RUN apt-get update && apt-get install --no-install-recommends -y dnsutils=1:9.11.5.P4+dfsg-5.1+deb10u11 libpq-dev python3-dev \
# && apt-get clean \
# && rm -rf /var/lib/apt/lists/*

RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list \
 && sed -i '/security.debian.org/d' /etc/apt/sources.list \
 && apt-get update \
 && apt-get install --no-install-recommends -y dnsutils libpq-dev python3-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# Install dependencies
RUN python -m pip install --no-cache-dir pip==22.0.4
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt


# copy project
COPY . /app/


#expose port 8000
EXPOSE 8000


RUN python3 /app/manage.py migrate

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers","6", "pygoat.wsgi"]
