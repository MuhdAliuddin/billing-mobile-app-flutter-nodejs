import {
  repository,
} from '@loopback/repository';
import {
  get,
  getModelSchemaRef,
  param,
} from '@loopback/rest';
import {
  BILLING,
  USER,
} from '../models';
import {BillingRepository} from '../repositories';

export class BillingUserController {
  constructor(
    @repository(BillingRepository)
    public billingRepository: BillingRepository,
  ) { }

  @get('/billings/{id}/user', {
    responses: {
      '200': {
        description: 'User belonging to Billing',
        content: {
          'application/json': {
            schema: getModelSchemaRef(USER),
          },
        },
      },
    },
  })
  async getUser(
    @param.path.number('id') id: typeof BILLING.prototype.id,
  ): Promise<USER> {
    return this.billingRepository.userId(id);
  }
}
