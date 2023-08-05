import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

const PORT = process.env.PORT || 3000
async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors({
    origin: process.env.CORS, // Specify your allowed origin
  });
  await app.listen(PORT, () =>{
    console.log(`Running on port ${PORT}`)
  });
}
bootstrap();
