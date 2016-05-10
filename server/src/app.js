import 'babel-polyfill';

import path from 'path';

import Koa from 'koa';
import serve from 'koa-static';
import compress from 'koa-compress';

const app = new Koa();

const production = process.env.NODE_ENV === "production";

if (production) app.use(compress());

const staticPath = path.join(__dirname, '../../client/dist');

console.log('serving folder', staticPath);

app.use(serve(staticPath));

app.listen(process.env.PORT);