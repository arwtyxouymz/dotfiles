export class {{_name_}} {
  private readonly _data: {{_input_:dataType}};

  constructor({{_expr_:tolower("{{_name_}}")}}: {{_input_:dataType}}) {
    if (!{{_expr_:tolower("{{_name_}}")}})
      throw new Error('');

    this._data = {{_expr_:tolower("{{_name_}}")}};
  }

  get data() {
    return this._data;
  }

  isEqual(other: this) {
    return this._data === other.data;
  }
}
