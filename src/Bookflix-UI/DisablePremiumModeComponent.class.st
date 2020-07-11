Class {
	#name : #DisablePremiumModeComponent,
	#superclass : #SimpleFormComponent,
	#instVars : [
		'errorByExcessProfiles'
	],
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #private }
DisablePremiumModeComponent >> buttonDescription [
	^ 'Desactivar'
]

{ #category : #private }
DisablePremiumModeComponent >> formTitle [
	^ 'Desactivar Premium'
]

{ #category : #initialization }
DisablePremiumModeComponent >> initialize [
	errorByExcessProfiles := false
]

{ #category : #callbacks }
DisablePremiumModeComponent >> onSubmit [
	self session user
		isPremium: false;
		save.
	^ AlertComponent with: 'Has desactivado el modo premium'
]

{ #category : #rendering }
DisablePremiumModeComponent >> renderDataInputOn: html [
	html
		paragraph:
			'Si desactivas el modo premium, ya no podras contar con 4 perfiles por cuenta.'.
	html paragraph: '¿Deseas Continuar?'.
	errorByExcessProfiles
		ifTrue: [ self renderErrorByExcessProfilesOn: html ]
]

{ #category : #rendering }
DisablePremiumModeComponent >> renderErrorByExcessProfilesOn: html [
	html small
		class: 'form-text text-danger mb-2';
		with:
			'Para desactivar el modo premium, no debes contar con más de 2 perfiles.'
]

{ #category : #seaside }
DisablePremiumModeComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Desactivar Premium'
]

{ #category : #validation }
DisablePremiumModeComponent >> validateInputData [
	errorByExcessProfiles := self session user canNotPremium not.
	^ errorByExcessProfiles not
]
