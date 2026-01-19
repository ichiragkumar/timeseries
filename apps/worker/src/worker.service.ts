import { Injectable } from '@nestjs/common';

@Injectable()
export class WorkerService {
  tick() {
    // later: consume CDC messages, write metrics, etc.
    return { ok: true, message: 'worker tick', ts: new Date().toISOString() };
  }
}