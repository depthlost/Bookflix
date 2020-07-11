Class {
	#name : #RemoveNoveltyModalComponent,
	#superclass : #RemoveReadableModalComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #callbacks }
RemoveNoveltyModalComponent >> removeReadable [
	Bookflix instance removeNovelty: readable
]
