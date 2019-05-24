import alsapy

totalCards = 0
cardNum = -1

while True:
	err,cardNum =alsapy.snd_card_next(cardNum)
	if cardNum<0:
		break
	err, name = alsapy.snd_card_get_name(cardNum)
	totalCards = totalCards + 1
	print (f"{cardNum}={name}")
print (f"ALSA found {totalCards} card(s)")
alsapy.snd_config_update_free_global()
