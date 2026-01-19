import { Controller, Get } from '@nestjs/common';
import { WorkerService } from './worker.service';


@Controller()
export class WorkerController {
  constructor(private readonly workerService: WorkerService) {}

  @Get('/health')
  health() {
    return { ok: true, service: 'worker', uptime: process.uptime() };
  }

  @Get('/tick')
  tick() {
    return this.workerService.tick();
  }
}