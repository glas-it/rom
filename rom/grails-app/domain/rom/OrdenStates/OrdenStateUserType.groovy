package rom.OrdenStates

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.hibernate.HibernateException;
import org.hibernate.usertype.UserType;

/**
 * ConsumicionStateUserType
 * A domain class describes the data object and it's mapping to the database
 */
class OrdenStateUserType implements UserType {

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
		if (! value) return null;
		String name = value.nombre
		if (name == OrdenStatePendiente.PENDIENTE)
			return new OrdenStatePendiente()
		else if (name == OrdenStateEnPreparacion.EN_PREPARACION)
			return new OrdenStateEnPreparacion()
		else if (name == OrdenStateTerminado.TERMINADO)
			return new OrdenStateTerminado()
		else if (name == OrdenStateEntregado.ENTREGADO)
			return new OrdenStateEntregado()
		else if (name == OrdenStateCancelado.CANCELADO)
			return new OrdenStateCancelado()
		else if (name == OrdenStateRechazado.RECHAZADO)
			return new OrdenStateRechazado()
		else if (name == OrdenStateAnulado.ANULADO)
			return new OrdenStateAnulado()
		else
			return null
	}
	@Override
	public Serializable disassemble(Object arg0) throws HibernateException {
		return (Serializable) deepCopy(arg0);
	}
	@Override
	public boolean equals(Object x, Object y) throws HibernateException {
		return false
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
			case OrdenStatePendiente.PENDIENTE:
				return new OrdenStatePendiente()
 
			case OrdenStateEnPreparacion.EN_PREPARACION:
				return new OrdenStateEnPreparacion()
			
			case OrdenStateTerminado.TERMINADO:
				return new OrdenStateTerminado()
				
			case OrdenStateEntregado.ENTREGADO:
				return new OrdenStateEntregado()
				
			case OrdenStateCancelado.CANCELADO:
				return new OrdenStateCancelado()
			
			case OrdenStateRechazado.RECHAZADO:
				return new OrdenStateRechazado()
			
			case OrdenStateAnulado.ANULADO:
				return new OrdenStateAnulado()	
					
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
			OrdenState estado = value
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
		// TODO Auto-generated method stub
		return OrdenState;
	}
		
	@Override
	public int[] sqlTypes() {
		return [ Types.VARCHAR ];
	}
}
