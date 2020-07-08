Class {
	#name : #EnablePremiumModeComponent,
	#superclass : #SimpleFormComponent,
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #private }
EnablePremiumModeComponent >> buttonDescription [
	^ 'Activar'
]

{ #category : #private }
EnablePremiumModeComponent >> formTitle [
	^ 'Activar Premium'
]

{ #category : #callbacks }
EnablePremiumModeComponent >> onSubmit [
	^ AlertComponent
		with: '¡Felicidades! ¡Ahora eres un usuario premium!'
]

{ #category : #rendering }
EnablePremiumModeComponent >> renderDataInputOn: html [
	html
		paragraph:
			'Al activar este modo, usted contara con beneficios premium del servicio.'.
	html paragraph: 'Podra contar con hasta 4 perfiles por cuenta.'
]

{ #category : #seaside }
EnablePremiumModeComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Activar Premium'
]
