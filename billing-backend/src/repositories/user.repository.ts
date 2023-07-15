import {Getter, inject} from '@loopback/core';
import {DefaultCrudRepository, HasManyRepositoryFactory, repository} from '@loopback/repository';
import {MysqlDataSource} from '../datasources';
import {BILLING, USER, UserRelations} from '../models';
import {BillingRepository} from './billing.repository';

export class UserRepository extends DefaultCrudRepository<
USER,
  typeof USER.prototype.id,
  UserRelations
> {

  public readonly billings: HasManyRepositoryFactory<BILLING, typeof USER.prototype.id>;

  constructor(
    @inject('datasources.mysql') dataSource: MysqlDataSource, @repository.getter('BillingRepository') protected billingRepositoryGetter: Getter<BillingRepository>,
  ) {
    super(USER, dataSource);
    this.billings = this.createHasManyRepositoryFactoryFor('billings', billingRepositoryGetter,);
    this.registerInclusionResolver('billings', this.billings.inclusionResolver);
  }
}
