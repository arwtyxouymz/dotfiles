import { injectable } from 'tsyringe';
import { I{{_input_:entity}}Repository } from '@/applications/{{_expr_:tolower("{{_input_:entity}}")}}';
import { {{_input_:entity}} } from '@/domains';
import { DynamoDBItem, DynamoDBClient, DynamoDBConstants } from '../core';
import { BaseRepository } from './BaseRepository';
import { plainToClass, classToPlain } from 'class-transformer';

/**
 *           PK            |           SK
 *  -----------------------|------------------------
 *    USER#<ユーザーID>    |   PROFILE#<ユーザーID>  
 */
@injectable()
export class {{_name_}}
  extends BaseRepository<{{_input_:entity}}>
  implements I{{_input_:entity}}Repository {
  protected readonly pkPrefixes = [];
  protected readonly skPrefixes = [];

  constructor(client: DynamoDBClient) {
    super(client);
  }

  async seed(entities: {{_input_:entity}}[]) {
    const items = entities.map((entity) => {
      if (!entity.id) entity.id = this.generateId();
      return entity;
    });
    const input = this.batchWriteBuilder
      .create()
      .puts(items.map((item) => this.toDynamoDb(item)))
      .buildInput();
    await this.batchWriteItemAsync(input);
  }

  protected fromDynamoDb(item: DynamoDBItem): {{_input_:entity}} {
    const entity = plainToClass({{_input_:entity}}, item.getEntityData());
    return entity;
  }

  protected toDynamoDb(entity: {{_input_:entity}}): DynamoDBItem {
    const dbItem = new DynamoDBItem(classToPlain(entity));
    dbItem.addPK(this.createPK());
    dbItem.addSK(this.createSK());
    return dbItem;
  }

}
