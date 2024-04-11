### THIS IS NOT WORKING YET DO NOT USE IT

# CashFactory-Alpine
Lightweight docker image stack (using docker compose) running many passive income applications (proxy host and bandwidth sharing) : Honeygain, EarnApp, IPRoyal Pawns, PacketStream and Peer2Profit.
Revenue depends on the quality of your network (mobile gets more, datacenter gets low or none) read more about this [here]().

# Installation:

- Install Alpine on your host machine (im using a container instead) or you can use a linux server running 24/7 as it's light on the cpu. 
- Download CashFactory into whatever directory you want: `mkdir CashFactory-Alpine && rm -rf ./CashFactory-Alpine/* && wget https://api.github.com/repos/modpotato/CashFactory-Alpine/releases/latest -O - |
tar -xzvf - -C CashFactory-Alpine`
- Go into the CashFactory-Alpine folder `cd CashFactory-Alpine`
- Run install script (`su` to elevate) `ash ./setup.sh`
- Register for any services you want to use [here](#registration)
- Update .env to contain your account credentials for each site
- (Optional) If you don't want or need all availible services, comment them out with `#` in `docker-compose.yml`
- (ONLY FOR EARNAPP) You need to link your node to your account. To get the id run `docker exec -it cashfactory_Earnapp_1 sh` and type `earnapp showid`. To add the device you need to use this link: https://earnapp.com/r/your-id replacing "your-id" with the id you found earlier with show-id.
- (ONLY FOR PEER2PROFIT) Registration is done using a telegram bot (you need to install telegram application)
- (ONLY FOR BITPING) You will need to enter manually credential to initialize (TODO : easier method) in CashFactory-Alpine as root: `docker run -it -v ./data/bitping/:/root/.bitping bitping/bitping-node:latest then enter your login. Once this is done CTL-C to shut the container down
- (ONLY FOR PROXYRACK) You will need to add your device uuid (see .env how to generate it) in the dashboard (dashboard -> devices -> add device)

# Registration

Depending on what you want to run, you will need to register for some of these if not all of them.

- Website [Earnapp](https://earnapp.com/i/ibU2gQTb)
- Website [Honeygain](https://r.honeygain.me/ASTOL59CFB)
- Telegram Dashboard [Peer2Profit](https://t.me/peer2profit_app_bot?start=1648514898624257521cf97)
- Website [IPRoyal Pawns](https://pawns.app/?r=modpotato)
- Website [Packetstream](https://packetstream.io/?psr=32GQ)
- Website [Traffmonetizer](https://traffmonetizer.com/?aff=52057) TODO: update url
- Website [Repocket](https://link.repocket.co/bPfa) TODO: update url
- Website [Proxylite](https://proxylite.ru/?r=UKXG8XMV) - Russian app, payout with crypto for non russian citizens.
- Website [Bitping](https://app.bitping.com?r=XLr65_of) - This tool only pay in crypto (BitcoinSV) TODO: update url
- Website [Proxyrack](https://peer.proxyrack.com/ref/08e43xzp6ixdutkxgwsf1vytiqbpcinvt2fge2lc)
- Website [EarnFm](https://earn.fm/ref/OLIVPSSY)

Start/stop procedure :

- To start stack: `sudo docker compose up -d` (in CashFactory directory)
- To stop stack: `sudo docker compose down` (in CashFactory directory)

License : 

- This product is free for use and may be copied and distributed freely in its original form.
- Personal modifications are allowed for your personal use, but modified copy are not allowed for distribution.

Compatibility :

- TODO: check performance on ct

Contact :

- bugs/requests : github issues
- email : mod@modhost.top
