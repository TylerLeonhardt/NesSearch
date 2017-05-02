# NesSearch

Nes Search is a simple Phoenix example that uses [elastic_sync](https://github.com/promptworks/elastic_sync) which supplies Phoenix projects a drop-in solution for adding search to ecto models using the power of [ElasticSearch](https://www.elastic.co/).

Never again do you need to roll your own Search for your Phoenix project :)

![](http://i.imgur.com/ityxNA1.png)

This example implements a simple search on top of Elastic Search through all NES games.

## Getting started

### Prereqs
1. Docker


NOTE: I HAVE NOT TESTED THESE STEPS YET
### Steps
1. Clone or download the zip (and extract)
2. `echo "DB_PASSWORD=postgres" > web-secrets.env` NOTE: don't forget to change the password later on
3. `docker-compose run web mix ecto.create`
4. `docker-compose run web mix ecto.migrate`
5. I supplied a CSV full of data. you can use your favorite method of loading the data to the `/api/games` endpoint (POST request)
6. `docker-compose up web`

At this point, you should be able to navigate to `http://localhost:4000/` to try searching
