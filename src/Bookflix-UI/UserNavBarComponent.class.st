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
			on: html;
		renderDropdownItem: 'Activar Premium'
			withCallback: [ self session mainComponent content
				call: EnablePremiumModeComponent new ]
			on: html;
		renderDropdownItem: 'Desactivar Premium'
			withCallback: [ self session mainComponent content
				call: DisablePremiumModeComponent new ]
			on: html
]
