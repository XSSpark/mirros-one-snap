# Dokumentation mirrOS 1.0

## Inhaltsverzeichnis

## Einleitung

## Zweck des Dokuments

## Technologien und Frameworks

### Frontend

* [Vue.js](https://vuejs.org)
* [jQuery](https://jquery.com)

### Backend

* [Vue.js](https://vuejs.org)

Javascript-Frameworks:<br>

* [jQuery](https://jquery.com)
* [jQuery UI](https://jqueryui.com)
* [Gridstack.js](http://troolee.github.io/gridstack.js/)
* [Horizon Swiper](http://horizon-swiper.sebsauer.de)
* [Drop](http://github.hubspot.com/drop/)
* [Tether](http://tether.io)
* [Vex](http://github.hubspot.com/vex/)

### API

* [Swagger](https://swagger.io)
* [Lumen](https://lumen.laravel.com)

### Datenbank

* MySQL

### Layout

* [Bootstrap 4](https://getbootstrap.com)
* [Fontawesome](https://fontawesome.io)

### Sprachsteuerung (Hotword Detection)

* [Snowboy](https://snowboy.kitt.ai)

### Localization

* [Glotpress](https://github.com/GlotPress/GlotPress-WP)

## mirrOS

### Grid-Layout (Modulanordnung)

#### Grössen der Module

#### Resizing der Module

### Layouteinstellungen

### Moduleinstellungen (Instanzeinstellugnen)

### Navigationbar

### mirrOS Einstellungen

### Zentrales Notification System

Ein zentrales und einheitliches Notification System soll bestimmte Meldungen an den Benutzer über den Spiegel ausgeben. Ein praktischer Anwendungsfall dafür wäre ein Output aus einem Scripts (siehe nächste Kapitel). 

* `Lampen eingeschaltet`
* `Sprachbefehl XY erkannt`
* usw.

## Scripts

Das mirr.OS soll über verschiedene ausführbare Scripts verfügen, die auf verschiedene Art und Weise ausgelöst werden können. Diese Scripts werden unter anderem mit den Modulen mitgeliefert, können aber auch direkt mit dem Betriebssystem mitgeliefert werden (z.B. Basics wie "Spiegel ein", "Spiegel aus").

Die Scripts können idealerweise Shell, Python, Ruby oder andere ausführbare Scripts sein.

### Background Module

Es soll möglich sein, bestimmte "Modul-Scripts" einzubinden ohne dafür ein Modul-Slot zu belegen. Das Script wird ebenfalls alle XY Minuten aktualisiert hat aber keine Anzeige im Frontend.


### Aktionen über Hardware-Buttons oder Touch

Externe Hardware-Buttons oder Touch-Kapazitive Sensoren sollen ermöglichen, bestimmte Aktionen bzw. Scripts ausführen können. 

### Hotword Detection

Mit [Snowboy](https://snowboy.kitt.ai) soll eine Hotword Detection implementiert werden, mit der bestimmte Aktionen (Scripts) ausgeführt werden können. 


## Module

### Aufbau


`/module`<br>
`/module/info.json`<br>
`/module/sizes.json`<br>
`/module/locales.json`<br>
`/module/module.json`<br>
`/module/seeds.json`<br>
`/module/templates/`<br>
`/module/templates/default.html`<br>
`/module/templates/2x1.html`<br>
`/module/settings/default.html`<br>
`/module/settings/2x1.html`<br>
`/module/frontend/default.js`<br>
`/module/frontend/2x1.js`<br>
`/module/scripts/lights_off.rb`<br>
`/module/scripts/lights_blue.sh`<br>
`/module/scripts/order_taxi.py`<br>

### Modulgrössen

```javascript
// sizes.json

{
	"sizes": [
		{
			"name": "default",
			"height": 3,
			"width": 6,
			"template": "default.html",
			"settings": "default.html",
			"script": "default.html"
		},
		{
			"name": "2x1",
			"height": 1,
			"width": 2,
			"template": "2x1.html",
			"settings": "2x1.html",
			"script": "2x1.html"
		},
		{
			"name": "1x1",
			"height": 1,
			"width": 1,
			"template": "1x1.html",
			"settings": "default.html",
			"script": "default.html"
		}
	]
}

```


### Initialisierung bzw. Reset eines Moduls

```javascript
// seeds.json

{
	"data": [
		{
			"key": "fuel_sort_by",
			"value": "name"
		},
		{
			"key": "fuel_max_stations",
			"value": 5
		}
	]
}

```


### Sprachen

```javascript
// locales.json

{
	"locales": {
		"urls": [
			"http://46.101.225.168/glotpress/projects/system/netatmo/",
			"http://46.101.225.168/glotpress/projects/system/"
		]
	}
}

```


### `module.json`

```javascript
// module.json

{
	"module": {
		"depenencies": {
			"sources": [
				{
					"name": "tankerkoenig",
					"version": "1.0.0",
					"required": true
				},
				{
					"name": "spritpreisrechner",
					"version": "1.0.0",
					"required": true
				}
			]
		},
		"assets": [
			{
				"url": "https://code.jquery.com/jquery-3.2.1.min.js",
				"group": "script",
				"required_in": [
					"settings/default.html",
					"template/*"
				]
			},
			{
				"url": "https://opensource.keycdn.com/fontawesome/4.7.0/font-awesome.min.css ",
				"group": "stylesheet",
				"required_in": [
					"settings/1x1.html",
					"template/1x1.html"
				]
			}
		]
	}
}

```




### Modulinstanzen

#### Modulinstanzen und Speichern der Daten




## Datenquellen

### Zweck

### Aubau

### Datenquellen-Typ (z.B "Kalender" oder "Tanken")

### Abhänigkeiten

### Eigenschaften

### Datenquelleninstanz



## Datenbankanbindung

### Namespacing




## Localization

### Platformen

### Update-Prozess

### Update Interval



## API

### Idee

Jeder Spiegel besitzt eine eigene API. Das Front- und Backend soll unäbhänig von der eigentlichen Logik funktionieren. So ist die API eigentlich das zentrale Herzstück des Spiegels, über welche die ganze Kommunikation läuft. 

Das Frontend bezieht von der API die Daten, welche auf dem Frontend angezeigt werden. Der Benutzer konfiguriert also seine Datenquelle und die Daten werden dann über die API zur Verfügung gestellt, damit das Frontend auf diese Daten zugreifen kann. 

Im Backend: Die Einstellungen von mirr.OS, die Konfiguration von mirr.OS, die Einstellugen der Modulinstanzen sowie die Anordnung der Module kann alles über die API abgefragt werden und anschliessend wieder gespeichert werden.

Mit diesem Setup ist es auch möglich, die API quasi als zentralen Hub im eigenen Netzwerk zu verwenden. So können z.B. aktuelle Daten von Lampenzuständen oder die Temperatur vom Thermostat von ein und der selben Quelle abgefragt werden und die Daten andersweitig verwenden. Die zur Verfügung stehenden Daten hängt von den Konfigurierten Datenquellen ab und wird natürlich auch für die Anzeige im Frontend verwendet.

So wird eine  zentrale und einheitliche Abfragemöglichkeit von verschiedenen Datenquellen angeboten, die alle gleich formatiert sind. 

Hier gibt es z.B. das Anwendungbeispiel mit dem Tanken Modul. Es gibt verschiedene Datenquellen für ein bestimmtes Modul (Tankerkönig.de / Spritpreisrechner.at). Damit nicht zwei verschiedne Moduel entwickelt werden müssen, werden dann idealerweise die Daten dieser Datenquellen von der API einheitlich formatiert und zur Verfügung gestellt. In den Modul(-instanz)einstellungen gibt es dann die Möglichkeit auszuwählen, von welcher Datenquelle diese Instanz die Daten beziehen soll.

Quasi spielt die interne API hier eine Zwischenstelle. Mit den zur Verfügung stehenden Datenquelle und den vom Benutzer eingegeben Einstellungen (wie. z.B. Keys, Tokens oder Accounts) werden die Daten von der externen API abgefragt (z.B. Tanken), dann einheitlich formatiert und dann über die interne API (z.B. JSON und/oder XML) zur Verfügung gestellt.

Ein weiterer Vorteil dieser Lösung ist, dass so alles von der Darstellung unabhängig ist. 
Sei es, wenn jemand sein eigenes Interface für die Steuerung für mirr.OS bauen will, später mal eine mobile native Applikation veröffentlicht werden soll oder es letztendlich nur für die Anzeige im Frontend verwendet wird, die API kann immer als zentraler Kommunkationspunkt genutzt werden.

### Groups

`Groups` regeln, welche `Modules` und `Sources` miteinander funktionieren.<br>

So haben zum Beispiel das `Module` `calendar_week` und die `Source` `Google Kalender` beide die `Group` `calendar`. Über diese Beziehung wird die festgelegt, dass `Modules` und `Sources` der gleichen Gruppe miteinander kompatibel sind.

#### Endpunkte

`/api/groups`<br>
`/api/groups/{group_name}`

#### Beziehungen

Feld | Model | Identifier | Beschreibung
---  | ---   | ---        | ---
category | `Category` | `Category`.name | Die Kategoriezugehörigkeit dieser Gruppe
sources | `Source` | - | Alle Datenquellen die dieser Gruppe angehören
modules | `Module` | - | Alle Module die dieser Gruppe angehören


#### Aufbau des Models

```javascript
{
	"name": String,
	"model": Model,
	"category": Category,
	"source_structure": Array,
	"modules": [Module],
	"sources": [Source]
}
```

#### Beispiel

```javascript
{
	"name": "calendar",
	"model": "group",
	"source_structure": [...],
	"category": "producivity",
	"modules": [...],
	"sources": [...]
}
```

<br>
---
<br>




### Modules

#### Endpunkte

`/api/modules`<br>
`/api/modules/{module_name}`<br>

#### Beziehungen

Feld | Model | Identifier | Beschreibung
---  | ---   | ---        | ---
group | `Group` | `Group`.name | Die Gruppe dieses Modules
category | `Category` | `Category`.name | Die Kategorie dieses Modules
sources | `Source` | - | Die mit diesem Modul kompatiblen Datenquellen
languages | `Language` | - | Die zu verfügbaren stehenden Sprachen dieses Moduls


#### Aufbau des Models

```javascript
{
	"name": String,
	"group": Group,
	"model": Model,
	"author": String,
	"category": Category,
	"version": String,
	"path": String,
	"website": String,
	"sizes": Array,
	"sources": [Source],
	"languages": [Language]
}
```

#### Beispiel

```javascript
{
	"name": "fuel",
	"group": "fuel",
	"model": "module",
	"author": "Marco Roth",
	"category": "productiviy",
	"version": "1.0.0",
	"path": "/api/sources/modules/fuel",
	"website": "https://glancr.de/modules/productivity/fuel/",
	"sizes": [...],
	"sources": [...],
	"languages": [...]
}
```


<br>
---
<br>

### ModuleInstances

#### Endpunkte

`/api/modules/{module_name}/{instance_id}`<br>
`/api/modules/{module_name}/{instance_id}/settings`<br>

#### Beziehungen

Feld | Model | Identifier | Beschreibung
---  | ---   | ---        | ---
module | `Module` | `Module`.name | Das übergeordnete Modul dieser Instanz


#### Aufbau des Models

```javascript
{
	"id": Integer,
	"module": Module,
	"model": Model,
	"path": String,
	"settings": Array,
	"config": {
		"width": Integer,
		"height": Integer,
		"col": Integer,
		"row": Integer
	}
}
```

#### Beispiel

```javascript
{
	"id": 1,
	"module": "fuel",
	"model": "module_instance",
	"path": "/api/modules/fuel/1",
	"settings": [...],
	"config": {
		"width": 6,
		"height": 3,
		"col": 1,
		"row": 1
	}
}
```


<br>
---
<br>



### Sources

#### Endpunkte

`/api/sources`<br>
`/api/sources/{source_name}`<br>

#### Beziehungen

Feld | Model | Identifier | Beschreibung
---  | ---   | ---        | ---
group | `Group` | `Group`.name | Die Gruppe dieser Datenquelle
category | `Category` | `Category`.name | Die Kategorie dieser Datenquelle
modules | `Module` | - | Die mit dieser Datenquelle kompatiblen Module
languages | `Language` | - | Die zu verfügbaren stehenden Sprachen dieser Datenquelle

#### Aufbau des Models

```javascript
{
	"name": String,
	"group": Group,
	"model": Model,
	"category": Category,
	"version": String,
	"author": String,
	"path": String,
	"website": String,
	"modules": [Module],
	"languages": [Language]  
}
```

#### Beispiel

```javascript
{
	"name": "google",
	"group": "calendar",
	"model": "source",
	"category": "productivity",
	"version": "1.0.0",
	"author": "Mattes Angelus",
	"path": "/api/sources/calendar/google/",
	"website": "http://glancr.de/sources/google/",
	"modules": [...],
	"languages": [...]  
}
```


<br>
---
<br>


### SourceInstances

#### Endpunkte

`/api/sources/{source_name}/{instance_id}`<br>
`/api/modules/{source_name}/{instance_id}/settings`<br>
`/api/modules/{source_name}/{instance_id}/data`<br>

#### Beziehungen

Feld | Model | Identifier | Beschreibung
---  | ---   | ---        | ---
category | `Category` | `Category`.name | Die Kategoriezugehörigkeit dieses Typs
sources | `Source` | - | Die vom diesem Typ verfügbaren Datequellen
modules | `Module` | - | Die vom diesem Typ verfügbaren Module


#### Aufbau des Models

```javascript
{
	"id": Integer,
	"source": Source,
	"model": Model,
	"path": String,
	"data": Array,
	"settings": Array
}
```

#### Beispiel


```javascript
{
	"id": 1,
	"source": "google",
	"model": "source_instance",
	"path": "/api/sources/google/1",
	"data": [],
	"settings": []
}
```

<br>
---
<br>


### Categories

#### Endpunkte

`/api/categories`<br>
`/api/categories/{category_name}`

#### Beziehungen

Feld | Model | Identifier | Beschreibung
---  | ---   | ---        | ---
sources | `Source` | - | Datenquellen, die dieser Kategorie angehören
modules | `Module` | - | Module, die dieser Kategorie angehören

#### Aufbau des Models


```javascript
{
	"name": String,
	"model": Model,
	"path": String,
	"website": String,
	"modules": [Module],
	"sources": [Source]
}
```

#### Beispiel

```javascript
{
	"name": "productivity",
	"model": "category",
	"path": "/api/categories/productivity/",
	"website": "http://glancr.de/modules/productivity/",
	"modules": [...],
	"sources": [...]
}
```

<br>
---
<br>


### Languages

#### Endpunkte

`/api/languages`<br>
`/api/languages/{language_name}`

#### Beziehungen

Feld | Model | Identifier | Beschreibung
---  | ---   | ---        | ---
sources | `Source` | - | Datenquellen, die diese Sprache unterstützen
modules | `Module` | - | Module, die diese Sprache unterstützen

#### Aufbau des Models

```javascript
{
	"name": String,
	"code": String,
	"model": Model,
	"path": String,
	"modules": [Module],
	"sources": [Source]  
}
```

#### Beispiel

```javascript
{
	"name": "Deutsch",
	"code": "de_DE",
	"model": "language",
	"path": "/api/languages/de_DE",
	"modules": [...],
	"sources": [...]
}
```


<br>
---
<br>

### Beispiel-Abfragen (vereinfacht)


### `/api`

```javascript
// Example: /api

{
	"name": "Glancr mirrOS",
	"version": "1.0.0",
	"webserver": "Apache 2",
	"device": "Raspberry 3",
	"os": "Raspian X.Y",
	"endpoints": [
		"/api/info",
		"/api/user",
		...
	],
	"documentation": "https://glancr.de/api-documentation"
}

```


### `/api/user`

```javascript
// Example: /api/user

{
	"name": "Marco Roth",
	"firstname": "Marco",
	"lastname": "Roth",
	"email": "marco.roth@intergga.ch",
	"city": "Basel",
	"country": "CH",
	"language": "de_DE"
}
```


### `/api/groups`

```javascript
// Example: /api/groups

{
	"groups": [
		{
			"name": "calendar",
			"modules": [
				{ "name": "calendar_week", ... },
				{ "name": "calendar_today", ... },
				{ "name": "calendar_next", ... }
			],
			"sources": [
				{ "name": "google", ... },
				{ "name": "icloud", ... },
				{ "name": "ical", ... }
			]
		},
		{
			"name": "fuel",
			"modules": [
				{ "name": "fuel", ... }
			],
			"sources": [
				{ "name": "Tankerkönig", ... },
				{ "name": "Spritpreisrechner", ... }
			]
		}
	]
}

```


### `/api/groups/{group_name}`

```javascript

// Example: /api/groups/calendar

{

}

```

### `/api/sources`

```javascript

// Example: /api/sources

{
	"sources": [
		{
			"name": "google",
			"group": "calendar",
			"version": "1.0.0",
			"author": "Mattes Angelus",
			"path": "/api/sources/calendar/google",
			"website": "https://google.com"  
		},
		{
			"name": "tankerkoenig",
			"group": "fuel",
			"version": "1.0.0",
			"path": "/api/sources/fuel/tankerkoenig",
			"website": "https://google.com"  
		}
	]
}

```

### `/api/sources/{source_name}`

```javascript

// Example: /api/sources/calendar

{
	"group": "calendar",
	"sources": [
		{
			"name": "google",
			"group": "calendar",
			"version": "1.0.0",
			"author": "Marco Roth",
			"path": "/api/sources/calendar/google"  
		},
		{
			"name": "icloud",
			"group": "calendar",
			"version": "1.0.0",
			"author": "Marco Roth",
			"path": "/api/sources/calendar/icloud"  
		},
		{
			"name": "ical",
			"group": "calendar",
			"version": "1.0.0",
			"author": "Marco Roth",
			"path": "/api/sources/calendar/ical"  
		}
	]
}

```


### `/api/sources/{source_name}/{instance_id}`

```javascript

// Example: /api/sources/calendar/1/

{

}

```


### `/api/sources/{source_name}/{instance_id}/settings`

```javascript

// Example: /api/sources/calendar/1/settings

{

}

```


### `/api/sources/{source_name}/{instance_id}/data`

```javascript

// Example: /api/sources/calendar/1/data

{

}

```


### `/api/modules`

```javascript

// Example: /api/modules

{
	"modules": [
		{
			"name": "fuel",
			"group": "fuel",
			"author": "Marco Roth",
			"version": "1.0.0",
			"path": "/api/sources/fuel/fuel"  
		},
		{
			"name": "calendar_week",
			"group": "calendar",
			"author": "Mattes Angelus",
			"version": "1.0.0",
			"path": "/api/sources/calendar/calendar_week"  
		}
	]
}

```


### `/api/modules/{module_name}`

```javascript
// Example: /api/modules/fuel

{

}

```


### `/api/modules/{module_name}/{instance_id}`

```javascript
// Example: /api/modules/fuel/1

{

}

```

### `/api/modules/{module_name}/{instance_id}/settings`

```javascript
// Example: /api/modules/fuel/1/settings

{

}

```


### `/api/categories`

```javascript
// Example: /api/categories

{
	"categories": [
		{

		}
	]
}

```


### `/api/categories/{category_name}`

```javascript
// Example: /api/modules/categories/productivity

{

}

```
