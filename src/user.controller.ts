import { Controller, Get, Req } from '@nestjs/common';
import { Request } from 'express';

@Controller('user')
export class UserController {
  @Get('browser-id')
  getBrowserId(@Req() req: Request): { browserId: string } {
    // Lire l'ID du navigateur depuis les cookies
    const browserId = req.cookies['userId'];
    if (!browserId) {
      return { browserId: 'No browser ID found' };
    }
    return { browserId };
  }
}
