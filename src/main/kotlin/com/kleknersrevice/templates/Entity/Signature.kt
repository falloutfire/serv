package com.kleknersrevice.templates.Entity

import org.hibernate.annotations.OnDelete
import org.hibernate.annotations.OnDeleteAction
import java.util.*
import javax.persistence.*

@Entity
@Table(name = "Signature")
class Signature(
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long,
    @Column(name = "Description")
    var description: String,
    @Column(name = "Date")
    var date: Date,
    @OneToMany(mappedBy = "signature", fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.CASCADE)
    var listDetails: List<SignatureDetails>
)

class SignatureFormat(
    val id: Long,
    val description: String,
    val date: Date,
    var signature: String
) {

    companion object {
        fun format(sign: Signature): SignatureFormat {
            val list = sign.listDetails.map { "${it.firstAngle}.${it.secondAngle}" }
            return SignatureFormat(
                sign.id,
                sign.description,
                sign.date,
                list.joinToString(prefix = "", postfix = "", separator = ":")
            )
        }
    }
}
