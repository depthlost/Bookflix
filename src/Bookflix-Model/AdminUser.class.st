Class {
	#name : #AdminUser,
	#superclass : #User,
	#category : #'Bookflix-Model'
}

{ #category : #testing }
AdminUser >> canAddProfile [
	^ false
]

{ #category : #abstract }
AdminUser >> isAdmin [
	^ true
]
