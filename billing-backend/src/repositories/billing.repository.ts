import {Getter, inject} from '@loopback/core';
import {BelongsToAccessor, DefaultCrudRepository, repository} from '@loopback/repository';
import {MysqlDataSource} from '../datasources';
import {BILLING, BillingRelations, USER} from '../models';
import {UserRepository} from './user.repository';

export class BillingRepository extends DefaultCrudRepository<
BILLING,
  typeof BILLING.prototype.id,
  BillingRelations
> {

  public readonly userId: BelongsToAccessor<USER, typeof BILLING.prototype.id>;

  constructor(
    @inject('datasources.mysql') dataSource: MysqlDataSource, @repository.getter('UserRepository') protected userRepositoryGetter: Getter<UserRepository>,
  ) {
    super(BILLING, dataSource);
    this.userId = this.createBelongsToAccessorFor('userId', userRepositoryGetter,);
    this.registerInclusionResolver('userId', this.userId.inclusionResolver);
  }
}
