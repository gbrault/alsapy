import alsapy

totalCards = 0
cardNum = -1

while True:
	err,cardNum =alsapy.snd_card_next(cardNum)
	if cardNum<0:
		break
	totalCards = totalCards + 1
print (f"ALSA found {totalCards} card(s)")
alsapy.snd_config_update_free_global()
