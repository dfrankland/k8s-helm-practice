import * as Koa from 'koa';
import * as Router from 'koa-router';

const PORT = parseInt(process.env.PORT || 'default', 10) || 3000;

const app = new Koa();
const router = new Router();

router.get('/*', async ctx => {
  ctx.body = 'Hello World!';
});

app.use(router.routes());

app.listen(PORT, () => {
  // eslint-disable-next-line no-console
  console.log(`Server running on port ${PORT}`);
});
