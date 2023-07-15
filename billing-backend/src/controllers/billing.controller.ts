import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  param,
  patch,
  post,
  put,
  requestBody,
  response,
} from '@loopback/rest';
import {BILLING} from '../models';
import {BillingRepository} from '../repositories';

export class BillingController {
  constructor(
    @repository(BillingRepository)
    public billingRepository : BillingRepository,
  ) {}

  @post('/billings')
  @response(200, {
    description: 'Billing model instance',
    content: {'application/json': {schema: getModelSchemaRef(BILLING)}},
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(BILLING, {
            title: 'NewBilling',
            exclude: ['id'],
          }),
        },
      },
    })
    billing: Omit<BILLING, 'id'>,
  ): Promise<BILLING> {
    return this.billingRepository.create(billing);
  }

  @get('/billings/count')
  @response(200, {
    description: 'Billing model count',
    content: {'application/json': {schema: CountSchema}},
  })
  async count(
    @param.where(BILLING) where?: Where<BILLING>,
  ): Promise<Count> {
    return this.billingRepository.count(where);
  }

  @get('/billings')
  @response(200, {
    description: 'Array of Billing model instances',
    content: {
      'application/json': {
        schema: {
          type: 'array',
          items: getModelSchemaRef(BILLING, {includeRelations: true}),
        },
      },
    },
  })
  async find(
    @param.filter(BILLING) filter?: Filter<BILLING>,
  ): Promise<BILLING[]> {
    return this.billingRepository.find(filter);
  }

  @patch('/billings')
  @response(200, {
    description: 'Billing PATCH success count',
    content: {'application/json': {schema: CountSchema}},
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(BILLING, {partial: true}),
        },
      },
    })
    billing: BILLING,
    @param.where(BILLING) where?: Where<BILLING>,
  ): Promise<Count> {
    return this.billingRepository.updateAll(billing, where);
  }

  @get('/billings/{id}')
  @response(200, {
    description: 'Billing model instance',
    content: {
      'application/json': {
        schema: getModelSchemaRef(BILLING, {includeRelations: true}),
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(BILLING, {exclude: 'where'}) filter?: FilterExcludingWhere<BILLING>
  ): Promise<BILLING> {
    return this.billingRepository.findById(id, filter);
  }

  @patch('/billings/{id}')
  @response(204, {
    description: 'Billing PATCH success',
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(BILLING, {partial: true}),
        },
      },
    })
    billing: BILLING,
  ): Promise<void> {
    await this.billingRepository.updateById(id, billing);
  }

  @put('/billings/{id}')
  @response(204, {
    description: 'Billing PUT success',
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() billing: BILLING,
  ): Promise<void> {
    await this.billingRepository.replaceById(id, billing);
  }

  @del('/billings/{id}')
  @response(204, {
    description: 'Billing DELETE success',
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.billingRepository.deleteById(id);
  }
}
