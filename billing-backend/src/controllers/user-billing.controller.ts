import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where,
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,
  patch,
  post,
  requestBody,
} from '@loopback/rest';
import {
  BILLING,
  USER,
} from '../models';
import {UserRepository} from '../repositories';

export class UserBillingController {
  constructor(
    @repository(UserRepository) protected userRepository: UserRepository,
  ) { }

  @get('/users/{id}/billings', {
    responses: {
      '200': {
        description: 'Array of User has many Billing',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(BILLING)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<BILLING>,
  ): Promise<BILLING[]> {
    return this.userRepository.billings(id).find(filter);
  }

  @post('/users/{id}/billings', {
    responses: {
      '200': {
        description: 'User model instance',
        content: {'application/json': {schema: getModelSchemaRef(BILLING)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof USER.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(BILLING, {
            title: 'NewBillingInUser',
            exclude: ['id'],
            optional: ['user_id']
          }),
        },
      },
    }) billing: Omit<BILLING, 'id'>,
  ): Promise<BILLING> {
    return this.userRepository.billings(id).create(billing);
  }

  @patch('/users/{id}/billings', {
    responses: {
      '200': {
        description: 'User.Billing PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(BILLING, {partial: true}),
        },
      },
    })
    billing: Partial<BILLING>,
    @param.query.object('where', getWhereSchemaFor(BILLING)) where?: Where<BILLING>,
  ): Promise<Count> {
    return this.userRepository.billings(id).patch(billing, where);
  }

  @del('/users/{id}/billings', {
    responses: {
      '200': {
        description: 'User.Billing DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(BILLING)) where?: Where<BILLING>,
  ): Promise<Count> {
    return this.userRepository.billings(id).delete(where);
  }
}
