import { injectable, inject } from 'tsyringe'
import { I{{_name_}} } from './I{{_name_}}'
import { I{{_input_:entity}}Repository, I{{_input_:entity}}RepositoryToken } from "../interfaces/I{{_input_:entity}}Repository";
import { {{_input_:entity}} } from "@/domains";

@injectable()
export class {{_name_}} implements I{{_name_}} {
  constructor(@inject(I{{_input_:entity}}RepositoryToken) private readonly repository: I{{_input_:entity}}Repository) {}

  async execute({{_cursor_}}) {}
}
