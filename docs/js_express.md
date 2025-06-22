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

## Swagger

// TODO

