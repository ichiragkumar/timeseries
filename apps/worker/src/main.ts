import { NestFactory } from '@nestjs/core';
import { WorkerModule } from './worker.module';


async function bootstrap() {
  const app = await NestFactory.create(WorkerModule);
  await app.listen(process.env.PORT ? Number(process.env.PORT) : 3004);
  console.log(`Worker running on http://localhost:${process.env.PORT || 3004}`);
}
bootstrap();