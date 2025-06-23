# ExpressJS

Express is a *NodeJS package* that allows the user to create
lightweight web applications.

## Setup of a Webserver

Creating a webserver with Express is quite simple. In the `index.js`
a server can be launched like that:

```js
import express from 'express';
const app = express();
const PORT = 3000;

app.get('/ping', (req, res) => {
    res.header('Content-Type', 'text/plain');
    res.send('pong');
});

app.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}`);
});
```

## Routing

Routing in Express is fairly intuitive, as it has a very simple set
of rules.

### HTTP Methods

If a route should be used with a certain HTTP method
(GET, POST, PUT, etc.), one of the following functions can be used to
define that route:

```js
app.get();
app.post();
app.put();
app.delete();
```

All of the functions above work in the same fashion an, thus, any
example made with one of them apply for the others as well.

This is a general example:

```js
app.get('/hello', (req, res) => {
    res.header('Content-Type', 'text/plain');
    res.send('Hello World!');
});
```

### Routes

The routes are specified in the first argument of the previously
discussed functions.

The route is simply the absolute path from the root of the webserver
(eg. `/movies/cast`).

#### Path Parameters

Routes in Express can also have parameters that are then accessible
from the route handler as `req.params['<param>']`.

This is an example on how the route parameters are defined:
`/say/:text` (here, the parameter would be accessed with
`req.params['text']`).

This comes together in the following example:

```js
app.get('/say/:text', (req, res) => {
    const text = req.params['text'];
    res.send(`Hi, there! ${text}`);
});
```

### Express Routers

Express has routers that can be used to define routes that can then
be attached to the express context with `app.use()`.

Here is an example of that:

```js
const express = require('express');
const router = express.Router();

// middleware that is specific to this router
const timeLog = (req, res, next) => {
  console.log('Time: ', Date.now());
  next();
}
router.use(timeLog);

// define the home page route
router.get('/', (req, res) => {
  res.send('Birds home page');
});
// define the about route
router.get('/about', (req, res) => {
  res.send('About birds');
});

module.exports = router;
```

In this case, the `index.js` file could look something like that:

```js
const express = require('express');
const router = require('./router.js');

const app = express();
const PORT = 3000;

app.get('/ping', (req, res) => {
    res.header('Content-Type', 'text/plain');
    res.send('pong');
});

app.use('/', router);

app.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}`);
});
```

Note that the approach using the router enables the `swagger-autogen`
package to automatically detect the routes defined on the router.

## Cookie Authentication

The `express-session` package enables us to handle user authentication
using cookies.

```js
const express = require('express');
const session = require('express-session');

app.use(express.json())
app.use(session({
    secret: 'supersecret',
    resave: false,
    saveUninitialized: false,
    cookie: {}
}));
```

Now, all endpoints can handle cookies and the data stored in them is
accessible over `req.session`.

## Swagger

Swagger (or rather swagger-ui) is a user interface that serves as a
documentation for APIs. 

### Generate the Documentation

The `swagger.json` file needed to build the UI can be generated using
the `swagger-autogen` package. The package is used as follows:

```js
const swaggerAutogen = require('swagger-autogen')();

const doc = {
  info: {
    title: 'My API',
    description: 'Description'
  },
  host: 'localhost:3000'
};

const outputFile = './swagger.json';
const routes = ['./path/userRoutes.js', './path/bookRoutes.js'];

/* NOTE: If you are using the express Router, you must pass in the
'routes' only the root file where the route starts, such as index.js,
app.js, routes.js, etc ... */

swaggerAutogen(outputFile, routes, doc);
```

The example above generates a swagger/openapi documentation for the
endpoints defined.

### Building the Swagger UI

With a valid API specification, we can build and serve the actual UI
using the `swagger-ui-express` package. The following example
ilustrates the usage of said package:

```js
const express = require('express');
const app = express();
const swaggerUi = require('swagger-ui-express');
const swaggerDocument = require('./swagger.json');

app.use(
    '/api-docs',
    swaggerUi.serve,
    swaggerUi.setup(swaggerDocument)
);
```

In the example, the documentation would be accessible from the
endpoint `/api-docs`.

