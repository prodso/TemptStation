/proc/kick(mob/M)
	to_chat(usr, "<span class='danger'>debug thing.</span>")





	if(ismob(M))
		if(!check_if_greater_rights_than(M.client))
			to_chat(usr, "<span class='danger'>Error: They have more rights than you do.</span>")
			return
		if(alert(usr, "Kick [key_name(M)]?", "Confirm", "Yes", "No") != "Yes")
			return
		if(!M)
			to_chat(usr, "<span class='danger'>Error: [M] no longer exists!</span>")
			return
		if(!M.client)
			to_chat(usr, "<span class='danger'>Error: [M] no longer has a client!</span>")
			return
		to_chat(M, "<span class='danger'>You have been kicked from the server by [usr.client.holder.fakekey ? "an Administrator" : "[usr.client.key]"].</span>")
		log_admin("[key_name(usr)] kicked [key_name(M)].")
		message_admins("<span class='adminnotice'>[key_name_admin(usr)] kicked [key_name_admin(M)].</span>")
		qdel(M.client)
