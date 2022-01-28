echo "Baixando o driver Dremio"; \
        wget  https://github.com/Baoqi/metabase-dremio-driver/releases/download/1.0.3/dremio.metabase-driver.jar \
        && echo "Baixando driver csv " \
        && wget https://github.com/Markenson/csv-metabase-driver/releases/download/v1.3.1/csv.metabase-driver.jar \
        && mv  dremio.metabase-driver.jar /plugins \
        && mv  csv.metabase-driver.jar /plugins \