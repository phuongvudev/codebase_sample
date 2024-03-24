import 'dart:convert';

abstract class IMapper<E, M> extends Converter {
  E fromModel(M model);

  M fromEntity(E entity);
}
