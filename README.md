# shokaibot

## Install Dependencies

    % npm install

## Run

    % DEBUG=* bin/hubot

### with Slack

    % HUBOT_SLACK_TOKEN=a1b2cdef3456 bin/hubot -a slack

## Test

    % npm test
    # or
    % grunt


## Deploy on Heroku

    % heroku create
    % git push heroku master

    % heroku config:set HUBOT_HEROKU_KEEPALIVE_URL=http://(app_name).herokuapp.com
    % heroku config:set NODE_ENV=production
    % heroku config:add TZ=Asia/Tokyo
    % heroku addons:add redistogo:nano
    % heroku config:set 'DEBUG=*'
