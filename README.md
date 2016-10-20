## 短信通知大乐透和双色球的开奖结果

SMS API用的是twilio<https://www.twilio.com/>，免费的短信接口，注册获取account_sid，auth_token和twilio phone number．
双色球是每周二、四、日21:15开奖，21:20发短信．
大乐透是每周一、三、六20:30开奖，20:35发短信．

    cp config/config.yml.sample config/config.yml

    `vim config/config.yml` to add configuration

### Config

    client:
      account_sid: ''
      auth_token: ''
    sms:
      from: ''
      to:
        - '+86123456'

### Run

    bundle update

    whenever --update-crontab

    crontab -l