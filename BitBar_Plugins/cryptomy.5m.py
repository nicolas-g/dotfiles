#!/usr/bin/env python3
# coding=utf-8
#
# <bitbar.title>NG App</bitbar.title>
# <bitbar.version>v0.1</bitbar.version>
# <bitbar.author>Nicolas G.</bitbar.author>
# <bitbar.author.github>nicolas-g</bitbar.author.github>
# <bitbar.desc>Displays the NG App</bitbar.desc>
# <bitbar.image>https://i.imgur.com/PjuyXQd.jpg</bitbar.image>
# <bitbar.dependencies>python</bitbar.dependencies>
# <bitbar.abouturl>http://url-to-about.com/</bitbar.abouturl>
#
# by NG.
#
import subprocess

BTC_PRICE_ALERT=36000
ETH_PRICE_ALERT=1200
BCH_PRICE_ALERT=550

btc_cmd = "curl -s https://api.coinbase.com/v2/prices/BTC-USD/buy | /usr/local/bin/jq '.data.amount'"
btc_cmd_process= subprocess.Popen(btc_cmd, shell=True, stdout=subprocess.PIPE,  stderr=subprocess.PIPE)
btc_stdout, btc_stderr = btc_cmd_process.communicate()
btc_stdout=btc_stdout.decode("utf-8")
btc_stdout=btc_stdout.strip()
btc_stdout=btc_stdout.replace('\"', '')
btc=float(btc_stdout)

eth_cmd = "curl -s https://api.coinbase.com/v2/prices/ETH-USD/buy | /usr/local/bin/jq '.data.amount'"
eth_cmd_process= subprocess.Popen(eth_cmd, shell=True, stdout=subprocess.PIPE,  stderr=subprocess.PIPE)
eth_stdout, eth_stderr = eth_cmd_process.communicate()
eth_stdout=eth_stdout.decode("utf-8")
eth_stdout=eth_stdout.strip()
eth_stdout=eth_stdout.replace('\"', '')
eth=float(eth_stdout)

bch_cmd = "curl -s https://api.coinbase.com/v2/prices/BCH-USD/buy | /usr/local/bin/jq '.data.amount'"
bch_cmd_process= subprocess.Popen(bch_cmd, shell=True, stdout=subprocess.PIPE,  stderr=subprocess.PIPE)
bch_stdout, bch_stderr = bch_cmd_process.communicate()
bch_stdout=bch_stdout.decode("utf-8")
bch_stdout=bch_stdout.strip()
bch_stdout=bch_stdout.replace('\"', '')
bch=float(bch_stdout)

if eth >= ETH_PRICE_ALERT or btc >= BTC_PRICE_ALERT or bch >= BCH_PRICE_ALERT :
    cmd = "/usr/bin/say -v Melina 'Ξύπνα, έωγαλες λευτά' --rate 250"
    process2 = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE,  stderr=subprocess.PIPE)
    stdout2, stderr2 = process2.communicate()
    print("B| color=red")
    print("---")
    print("BTC: ", btc_stdout, "| href=https://coinmarketcap.com/currencies/bitcoin/")
    print("ETH: ", eth_stdout, "| href=https://coinmarketcap.com/currencies/ethereum/")
    print("BCH: ", bch_stdout, "| href=https://coinmarketcap.com/currencies/bitcoin-cash/")
else:
    print("B| color=green")
    print("---")
    print("BTC: ", btc_stdout, "| href=https://coinmarketcap.com/currencies/bitcoin/")
    print("ETH: ", eth_stdout, "| href=https://coinmarketcap.com/currencies/ethereum/")
    print("BCH: ", bch_stdout, "| href=https://coinmarketcap.com/currencies/bitcoin-cash/")
