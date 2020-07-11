Class {
	#name : #UserNavBarComponent,
	#superclass : #SessionNavBarComponent,
	#category : #'Bookflix-UI-navbars'
}

{ #category : #getting }
UserNavBarComponent >> nickname [
	^ self session profile name
]

{ #category : #rendering }
UserNavBarComponent >> renderUserTopItemsOn: html [
	super renderUserTopItemsOn: html.
	self
		renderDropdownItem: 'Perfiles'
		withCallback: [ self session mainComponent content
				call: UserProfilesViewComponent new ]
		on: html.
	self session user isPremium
		ifFalse: [ self
				renderDropdownItem: 'Activar Premium'
				withCallback: [ self session mainComponent content
						call: EnablePremiumModeComponent new ]
				on: html ]
		ifTrue: [ self
				renderDropdownItem: 'Desactivar Premium'
				withCallback: [ self session mainComponent content
						call: DisablePremiumModeComponent new ]
				on: html ]
]
