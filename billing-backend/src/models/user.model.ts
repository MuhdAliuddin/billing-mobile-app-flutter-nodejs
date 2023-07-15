import {Entity, hasMany, model, property} from '@loopback/repository';
import {BILLING} from './billing.model';

@model()
export class USER extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
  })
  name: string;

  @property({
    type: 'string',
    required: true,
  })
  phone_num: string;

  @property({
    type: 'string',
    required: true,
  })
  email: string;

  @property({
    type: 'string',
    required: true,
  })
  ic_num: string;

  @property({
    type: 'date',
    required: true,
  })
  exp_date: string;

  @property({
    type: 'string',
    required: true,
  })
  plan_type: string;

  @hasMany(() => BILLING, {keyTo: 'user_id'})
  billings: BILLING[];

  constructor(data?: Partial<USER>) {
    super(data);
  }
}

export interface UserRelations {
  // describe navigational properties here
}

export type UserWithRelations = USER & UserRelations;
