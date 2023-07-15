import {Entity, belongsTo, model, property} from '@loopback/repository';
import {USER} from './user.model';

@model()
export class BILLING extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;
  @property({
    type: 'number',
    required: true,
  })
  amount: number;

  @property({
    type: 'date',
    required: true,
  })
  month: string;

  @property({
    type: 'number',
    required: true,
  })
  status: number;

  @property({
    type: 'string',
    required: true,
  })
  receipt: string;

  @belongsTo(() => USER, {name: 'userId'})
  user_id: number;

  constructor(data?: Partial<BILLING>) {
    super(data);
  }
}

export interface BillingRelations {
  // describe navigational properties here
}

export type BillingWithRelations = BILLING & BillingRelations;
