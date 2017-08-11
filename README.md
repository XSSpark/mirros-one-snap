# Dokumentation mirrOS 1.0

## Inhaltsverzeichnis


## Einleitung


## Zweck des Dokuments



## Technologien und Frameworks

### Frontend

### Backend

### "Datenbank"

### Layout

### Localization




## mirrOS

### Grid-Layout (Modulanordnung)

### Grössen der Module

### Resizing der Module

### Layouteinstellungen

### Moduleinstellungen (Instanzeinstellugnen)

### Navigationbar

### mirrOS Einstellungen



## Module

### Zweck

### Aufbau


`/fuel`<br>
`/fuel/info.json`<br>
`/fuel/sizes.json`<br>
`/fuel/locales.json`<br>
`/fuel/module.json`<br>
`/fuel/seeds.json`<br>
`/fuel/templates/`<br>
`/fuel/templates/default.html`<br>
`/fuel/templates/2x1.html`<br>
`/fuel/settings/default.html`<br>
`/fuel/settings/2x1.html`<br>
`/fuel/scripts/default.html`<br>
`/fuel/scripts/2x1.html`<br>

### Modulgrössen

```json
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

```json
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

```json
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

```json
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

```json
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

```json
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
language | `Language` | - | Die zu verfügbaren stehenden Sprachen dieses Moduls


#### Aufbau des Models

```json
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

```json
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

```json
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

```json
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
language | `Language` | - | Die zu verfügbaren stehenden Sprachen dieser Datenquelle

#### Aufbau des Models

```json
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

```json
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

```json
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


```json
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


```json
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

```json
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

```json
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

```json
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

### Endpunkte


### `/api`

```json
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

```json
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

```json
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

```json

// Example: /api/groups/calendar

{

}

```

### `/api/sources`

```json

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

```json

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

```json

// Example: /api/sources/calendar/1/

{

}

```


### `/api/sources/{source_name}/{instance_id}/settings`

```json

// Example: /api/sources/calendar/1/settings

{

}

```


### `/api/sources/{source_name}/{instance_id}/data`

```json

// Example: /api/sources/calendar/1/data

{

}

```


### `/api/modules`

```json

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

```json
// Example: /api/modules/fuel

{

}

```


### `/api/modules/{module_name}/{instance_id}`

```json
// Example: /api/modules/fuel/1

{

}

```

### `/api/modules/{module_name}/{instance_id}/settings`

```json
// Example: /api/modules/fuel/1/settings

{

}

```


### `/api/categories`

```json
// Example: /api/categories

{
	"categories": [
		{

		}
	]
}

```


### `/api/categories/{category_name}`

```json
// Example: /api/modules/categories/productivity

{

}

```
