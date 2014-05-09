package rom.PedidoStates

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.hibernate.HibernateException;
import org.hibernate.usertype.UserType;

/**
 * PedidoStateUserType
 * A domain class describes the data object and it's mapping to the database
 */
class PedidoStateUserType implements UserType {

    static	mapping = {
    }
    
	static	constraints = {
    }

	@Override
	public Object assemble(Serializable arg0, Object arg1)
			throws HibernateException {
		return deepCopy(arg0);
	}
	
	@Override
	public Object deepCopy(Object value) throws HibernateException {
		String name = value.nombre
		if (name == PedidoStateAbierto.ABIERTO)
			return new PedidoStateAbierto()
		else if (name == PedidoStateCerrado.CERRADO)
			return new PedidoStateCerrado()
		else if (name == PedidoStatePagado.PAGADO)
			return new PedidoStatePagado()
		else if (name == PedidoStateAnulado.ANULADO)
			return new PedidoStateAnulado()
		else
			return null;
	}
	
	@Override
	public Serializable disassemble(Object arg0) throws HibernateException {
		return (Serializable) deepCopy(arg0);
	}
	
	@Override
	public boolean equals(Object arg0, Object arg1) throws HibernateException {
		return false;
	}
	
	@Override
	public int hashCode(Object arg0) throws HibernateException {
		if (! arg0) return 0;
		return arg0.hashCode();
	}
	
	@Override
	public boolean isMutable() {
		return true;
	}
	
	@Override
	public Object nullSafeGet(ResultSet rs, String[] names, Object arg2)
			throws HibernateException, SQLException {
		String name = rs.getString(names[0])
		switch (name) {
			case PedidoStateAbierto.ABIERTO:
				return new PedidoStateAbierto()

			case PedidoStateCerrado.CERRADO:
				return new PedidoStateCerrado()
			
			case PedidoStatePagado.PAGADO:
				return new PedidoStatePagado()
				
			case PedidoStateAnulado.ANULADO:
				return new PedidoStateAnulado()
				
			default:
				throw new RuntimeException("El estado de la orden esta corrupto")
		}
	}
	
	@Override
	public void nullSafeSet(PreparedStatement st, Object value, int index)
			throws HibernateException, SQLException {
		if (! value) {
			st.setNull(index, sqlTypes()[0]);
		} else {
			PedidoState estado = value
			st.setString(index, estado.nombre);
		}
	}
			
	@Override
	public Object replace(Object arg0, Object arg1, Object arg2)
			throws HibernateException {
		return deepCopy(arg0);
	}
	
	@Override
	public Class returnedClass() {
		return PedidoState;
	}
	
	@Override
	public int[] sqlTypes() {
		return [ Types.VARCHAR ];
	}
}
