"use strict";

$ = jQuery
$('#inputEmail,#inputPassword,#inputPassword2').on 'change', ->
	$this 	= $(this)
	ctrl 	= $this.parents 'div.control-group'
	success	= false 
	
	# $(element).wrap('<div>')
	# data-equals (email|reg-exp|field:selector)
	# data-callback (true|fals)
	if $this.attr('id') is 'inputEmail'
		if $this.val() is 'ali.kaafarani@turistforeningen.no'
			success = true 
	else if $this.attr('id') is 'inputPassword2'
		if $('#inputPassword').val() is $('#inputPassword2').val()
			success = true
	else
		return false
	
	if $this.next().length is 0
		$this.parent().addClass 'input-append' 
		$this.after '<span class="add-on"><i></i></span>'
	
	if success
		ctrl.toggleClass 'success', true
		ctrl.toggleClass 'error', false
		$this.next().find('i').attr 'class', 'icon-ok'
		
		setTimeout ->
			ctrl.removeClass 'success'
		, 3000

	else
		ctrl.toggleClass 'success', false
		ctrl.toggleClass 'error', true
		$this.next().find('i').attr 'class', 'icon-remove'
			
	true